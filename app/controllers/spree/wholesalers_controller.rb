class Spree::WholesalersController < Spree::BaseController
  respond_to :html, :xml

  def index
  end

  def show
    @wholesaler = Spree::Wholesaler.find(params[:id])
    respond_with(@wholesaler)
  end

  def new
    @wholesaler = Spree::Wholesaler.new
    @wholesaler.build_user
    respond_with(@wholesaler)
  end

  def create
    @wholesaler = Spree::Wholesaler.new(wholesaler_params)
    if @wholesaler.save
      flash[:notice] = Spree.t('spree.wholesaler.signup_success')
      redirect_to spree.wholesalers_path
    else
      flash[:error] = Spree.t('spree.wholesaler.signup_failed')
      render :action => "new"
    end
  end

  def edit
    @wholesaler = Spree::Wholesaler.find(params[:id])
    respond_with(@wholesaler)
  end

  def update
    @wholesaler = Spree::Wholesaler.find(params[:id])

    if @wholesaler.update_attributes(wholesaler_params)
      flash[:notice] = Spree.t('spree.wholesaler.update_success')
    else
      flash[:error] = Spree.t('spree.wholesaler.update_failed')
    end
    respond_with(@wholesaler)
  end

  def destroy
    @wholesaler = Spree::Wholesaler.find(params[:id])
    @wholesaler.destroy
    flash[:notice] = Spree.t('spree.wholesaler.destroy_success')
    respond_with(@wholesaler)
  end

  private

  def wholesaler_params
    params.require(:wholesaler).permit(:company, :buyer_contact, :manager_contact, :phone, :fax, :resale_number, :taxid, :web_address, :terms, :notes, user_attributes: [:email, :password, :password_confirmation])
  end
end
