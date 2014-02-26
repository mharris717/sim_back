module SimBack
  class << self
    def classes
      [SimBack::SimProgress]
    end

    def worker_classes
      [SimBack::Worker,SimBack::SummaryWorker]
    end

    def delete_all!
      classes.each { |x| x.destroy_all }
      worker_classes.each do |cls|
        cls.jobs.clear if cls.respond_to?(:jobs)
      end
    end
  end
end