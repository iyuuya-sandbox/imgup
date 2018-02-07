class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :auto_orient
  # process :resize_to_fill => [960, 960]
  process :resize_to_limit => [960, 960]

  version :sketching do
    process :sketching => [4, 0]
  end

  version :isolate do
    process :isolate
  end

  version :isolate5 do
    process :isolate => 5
  end

  version :hoge do
    process :isolate => 5
    process :sketching
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def auto_orient
    manipulate! do |image|
      image.auto_orient
    end
  end

  def sketching(detail = 4, saturation = 100)
    manipulate! do |image|
      system "#{Rails.root.join('bin', 'sketching')} -d #{detail} -e 2 -s #{saturation} #{image.path} #{image.path}"
      image = MiniMagick::Image.open(image.path)
      image = yield(image) if block_given?
      image
    end
  end

  def isolate(t = 10)
    manipulate! do |image|
      c = 'red'
      system <<-EOS
#{Rails.root.join('bin', 'isolatecolor')} -c #{c} -t #{t} -S 0 -s 100 #{image.path} #{image.path}
      EOS
      image = MiniMagick::Image.open(image.path)
      image = yield(image) if block_given?
      image
    end
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
