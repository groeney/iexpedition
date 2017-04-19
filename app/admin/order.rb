ActiveAdmin.register Order do

  permit_params :user_id, :voyage_id, :status, :coupon_id, :deposit_invoice_link, :deposit_invoice,
                :payment_invoice_link, :payment_invoice, :payment_summary,
                vouchers_attributes: [:id, :link_name, :document, :_destroy]

  index do
    selectable_column
    column :id
    column :user
    column :voyage
    column :status
    column :coupon
    column :deposit_invoice_link
    column 'Deposit Invoice', sortable: false do |order|
      link_to order.deposit_invoice_file_name, order.deposit_invoice.url, target: :_blank if order.deposit_invoice.present?
    end
    column :payment_invoice_link
    column 'Payment Invoice', sortable: false do |order|
      link_to order.payment_invoice_file_name, order.payment_invoice.url, target: :_blank if order.payment_invoice.present?
    end
    column :payment_summary
    actions
  end

  show do |order|
    attributes_table do
      row :id
      row :user
      row :voyage
      row :status
      row :coupon
      row :deposit_invoice_link
      row :deposit_invoice do
        link_to order.deposit_invoice_file_name, order.deposit_invoice.url, target: :_blank if order.deposit_invoice.present?
      end
      row :payment_invoice_link
      row :payment_invoice do
        link_to order.payment_invoice_file_name, order.payment_invoice.url, target: :_blank if order.payment_invoice.present?
      end
      row :payment_summary
    end
    div do
      h2 'Vouchers'
      order.vouchers.each do |voucher|
        h4 link_to voucher.link_name, voucher.document.url, target: '_blank'
      end
    end
  end

  form multipart: true  do |f|
    f.inputs do
      f.input :user
      f.input :voyage
      f.input :status
      f.input :coupon
      f.input :deposit_invoice_link
      f.input :deposit_invoice
      f.input :payment_invoice_link
      f.input :payment_invoice
      f.input :payment_summary
      f.has_many :vouchers do |p|
        p.input :link_name
        p.input :document, hint: p.object.document_file_name
        p.input :_destroy, as: :boolean, required: false, label: 'Remove'
      end
    end
    f.actions
  end

end