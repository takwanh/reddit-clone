class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id
    @subscription.save

    redirect_to community_path(@subscription.community_id)
  end

  def destroy
    subscription = Subscription.find(params[:id])
    community_id = subscription.community_id
    subscription.destroy
    redirect_to community_path(community_id)
  end

  private
    
    def subscription_params
      params.require(:subscription).permit(:community_id)
    end
end
