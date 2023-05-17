SimpleForm.setup do |config|
  # Wrappers configration
  config.wrappers :default, class: "form__group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "visually-hidden"
    b.use :input, class: "form__input", error_class: "form__input--invalid"
  end

  config.wrappers :checkbox, :tag => 'div', wrapper_html: {"data-controller" => "checkbox"}, :class => 'checkbox__group', error_class: 'checkbox__group--invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "checkbox__group__label"
    # using stimulus js controller to manage, if you don't set it up they will be normal checkboxes
    b.use :input, class: "form__checkbox", "data-checkbox-target" => "box", "data-action" => "click->checkbox#handleClick"
  end

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.label_text                      = lambda { |label, _, _| label }
  config.error_notification_tag          = :div
  config.error_notification_class        = "error_notification"
  config.browser_validations             = false
  config.boolean_style                   = :nested
  config.boolean_label_class             = "form__checkbox-label"
end