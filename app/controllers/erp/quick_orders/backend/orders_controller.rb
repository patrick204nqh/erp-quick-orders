module Erp
  module QuickOrders
    module Backend
      class OrdersController < Erp::Backend::BackendController
        before_action :set_order, only: [:destroy, :set_status_pending, :set_status_confirmed, :set_status_done, :set_status_canceled]
        before_action :set_orders, only: [:delete_all]

        # GET /orders
        def index
        end

        def list
          @orders = Order.search(params).paginate(:page => params[:page], :per_page => 20)

          render layout: nil
        end

        def order_details
          @order = Order.find(params[:id])

          render layout: nil
        end

        # DELETE /orders/1
        # def destroy
        #   @order.destroy
        #   respond_to do |format|
        #     format.html { redirect_to erp_quick_orders.backend_orders_path, notice: t('.success') }
        #     format.json {
        #       render json: {
        #         'message': t('.success'),
        #         'type': 'success'
        #       }
        #     }
        #   end
        # end

        # DELETE /orders/delete_all?ids=1,2,3
        # def delete_all
        #   @orders.destroy_all

        #   respond_to do |format|
        #     format.json {
        #       render json: {
        #         'message': t('.success'),
        #         'type': 'success'
        #       }
        #     }
        #   end
        # end

        def set_status_pending
          respond_to do |format|
            format.html { redirect_to erp_quick_orders.backend_orders_path, notice: t('.success') }
            if @order.set_status_pending
              format.json { render json: {'message': t('.success'),'type': 'success'} }
            else
              format.json { render json: {'message': t('.error'),'type': 'error'} }
            end
          end
        end

        def set_status_confirmed
          respond_to do |format|
            format.html { redirect_to erp_quick_orders.backend_orders_path, notice: t('.success') }
            if @order.set_status_confirmed
              format.json { render json: {'message': t('.success'),'type': 'success'} }
            else
              format.json { render json: {'message': t('.error'),'type': 'error'} }
            end
          end
        end

        def set_status_done
          respond_to do |format|
            format.html { redirect_to erp_quick_orders.backend_orders_path, notice: t('.success') }
            if @order.set_status_done
              format.json { render json: {'message': t('.success'),'type': 'success'} }
            else
              format.json { render json: {'message': t('.error'),'type': 'error'} }
            end
          end
        end

        def set_status_canceled
          respond_to do |format|
            format.html { redirect_to erp_quick_orders.backend_orders_path, notice: t('.success') }
            if @order.set_status_canceled
              format.json { render json: {'message': t('.success'),'type': 'success'} }
            else
              format.json { render json: {'message': t('.error'),'type': 'error'} }
            end
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_order
            @order = Order.find(params[:id])
          end

          def set_orders
            @orders = Order.where(id: params[:ids])
          end

          # Only allow a trusted parameter "white list" through.
          def order_params
            params.fetch(:order, {}).permit(:customer_name, :phone, :email, :product_id, :product_name, :price, :quantity, :note)
          end
      end
    end
  end
end
