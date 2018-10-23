class DisbursementsController < ApplicationController
  def index
    disbursements = select_disbursements
    render json: disbursements, status: status
  end

  private

  def select_disbursements
    disbursements = Disbursement.all
    disbursements = disbursements.by_merchant(params[:merchant]) if params[:merchant]
    disbursements.by_week_number(params[:week_number], params[:year])
  end
end
