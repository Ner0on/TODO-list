class TaskManagerController < ApplicationController

  def index
  	@tasks = Tasks.all.order('created_at DESC')
    @count = Tasks.all.count
    @unc = Tasks.where(position: 1).count
    @com = Tasks.where(position: 2).count
  end

  def destroy
  	task = Tasks.find(params[:id])
  	task.destroy
    total = Tasks.count
    unc = Tasks.where(position: 1).count
    com = Tasks.where(position: 2).count
  	render json: {total: total, unc:unc, com:com}
  end

  def create
  	i = Tasks.create(name: params[:input])
    name = i.name
    position = i.position
    id = i.id
    count = Tasks.all.count
  	render json: {count: count,position: position,id: id, }
  end

  def update

  	task = Tasks.find(params[:id])
    
    if task.position == 1
      task.update_attribute(:position, 2)
    else
      task.update_attribute(:position, 1)
    end
    t = Tasks.find(params[:id])
    posit = t.position
    unco = Tasks.where(position: 1).count
    comp = Tasks.where(position: 2).count
    render json: {unco: unco, comp: comp, posit: posit}
  end


end
	