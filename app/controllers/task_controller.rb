class TaskController < ApplicationController
  protect_from_forgery

  def update
    task = Task.find(params["id"])
    task.text = params["text"]
    task.start_date = params["start_date"]
    task.duration = params["duration"]
    task.parent = params["parent"]
    task.status = params["status"]
    task.user = params["user"]
    task.user_id = params["user_id"]
    task.save

    render :json => {:status => "ok"}
  end

  def add
    task = Task.create :text => params["text"], :start_date=> params["start_date"], :duration => params["duration"],
                       :parent => params["parent"], :status => params["status"], :user => params["user"], :user_id => params["user_id"]

    render :json => {:tid => task.id}
  end

  def delete
    Task.find(params["id"]).destroy
    render :json => {:status => "ok"}
  end
end
