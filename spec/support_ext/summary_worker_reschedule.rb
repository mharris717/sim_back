module SimBack
  class SummaryWorker
    def reschedule(*args)
      if Sidekiq::Testing.fake?
        klass.perform_in(2.seconds,*args)
      end
    end
  end
end