class KalendarController < ApplicationController
  def index
  end

  def data
    tasks = Task.all

    render :json=>{
        :data => tasks.map{|task|{
            :id => task.id,
            :text => task.text,
            :start_date => task.start_date.to_formatted_s(:db),
            :duration => task.duration,
            :parent => task.parent,
            :status => task.status,
            :user => task.user,
            :user_id => task.user_id
        }}
    }
  end
end
