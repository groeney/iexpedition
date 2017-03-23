ActiveAdmin.register Order do

  permit_params :user_id, :voyage_id, :status, :coupon_id, :deposit_invoice_link, :deposit_invoice,
                :payment_invoice_link, :payment_invoice, :payment_summary

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
  end

  form do |f|
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
    end
    f.actions
  end

end
