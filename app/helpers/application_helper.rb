module ApplicationHelper
    def class_yielder(yielded = '')
        unless yielded.empty?
          yielded
        else
          'empty'
        end
    end
end
