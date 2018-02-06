class JobQueue {
  constructor(delay) {
    this.queue = []
    this.delay = delay
    this.running = false
  }

  add_job(fn) {
    if (this.running) {
      this.queue.push(fn)
    } else {
      this.run(fn)
    }
  }

  run(fn) {
    this.running = true
    fn()
    setTimeout(() => {
    this.running = false
      if (this.queue.length > 0) this.run(this.queue.shift())
    }, this.delay)
  }
}

this.App || (this.App = {});
this.App.job_queue = new JobQueue(5 * 1000);
