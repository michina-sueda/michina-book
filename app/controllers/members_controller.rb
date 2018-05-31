class MembersController < ApplicationController
  def index
    @members = Member.order :yomi
  end
  
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path, notice: "#{@member.name}を登録しました"
    else
      render action: :new
    end
  end
  
  def edit
    @member = find_member_by_id
  end

  def update
    @member = find_member_by_id
    if @member.update(member_params)
      redirect_to members_path
    else
      render action: :edit
    end
  end
  
  def destroy
    @member = find_member_by_id
    @member.destroy
    redirect_to members_path, notice: "#{@member.name}を削除しました"
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :yomi, :phone)
  end

  def find_member_by_id
    Member.find(params[:id])
  end
end
