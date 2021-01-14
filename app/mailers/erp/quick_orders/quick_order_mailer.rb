module Erp::QuickOrders
  class QuickOrderMailer < Erp::ApplicationMailer
    helper Erp::ApplicationHelper
    # helper Erp::OnlineStore::ApplicationHelper
    
    def sending_admin_email_order_confirmation(quick_order)
      @recipients = ['Hùng Nguyễn <hungnt@hoangkhang.com.vn>', 'Luân Phạm <luanpm@hoangkhang.com.vn>', 'Sơn Nguyễn <sonnn@hoangkhang.com.vn>']
      
      @quick_order = quick_order
      send_email(@recipients.join("; "), "[THCN] -#{Time.current.strftime('%Y%m%d')}- YÊU CẦU ĐẶT HÀNG TRÊN TÌM HÀNG CÔNG NGHỆ")
    end
    
    def sending_customer_email_order_confirmation(quick_order)
      @quick_order = quick_order
      send_email(@quick_order.email, "#{Time.current.strftime('%Y%m%d')} - XÁC NHẬN ĐƠN ĐẶT HÀNG")
    end
  end
end