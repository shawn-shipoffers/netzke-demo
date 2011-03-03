class ClerkForm < Netzke::Basepack::PagingFormPanel
  js_property :title, "Clerk Paging Form With Custom Layout"

  def default_config
    super.merge(:model => "Clerk")
  end

  def configuration
    boss_contact = [
      {:field_label => "First name", :name => :boss__first_name, :read_only => true},
      {:field_label => "Last name", :name => :boss__last_name, :read_only => true},
      {:field_label => "Email", :name => :boss__email, :read_only => true}
    ]

    boss_details = [
      {:field_label => "Salary", :name => :boss__salary, :read_only => true},
      {:field_label => "Amount of clerks", :name => :boss__clerks_number, :read_only => true}
    ]

    super.tap do |s|
      s[:items] = [
        {
          :layout => :hbox, :border => false,
          :items => [
            {:flex => 1, :layout => :form, :border => false, :defaults => {:anchor => "-8"}, :items => [:first_name, :email]},
            {:flex => 1, :layout => :form, :border => false, :defaults => {:anchor => "100%"}, :items => [:last_name, :salary]}
          ]
        },

        :boss__name,

        {
          :xtype => :fieldset, :title => "Boss info",
          :items => [
            {
              :xtype => :tabpanel, :padding => 5, :plain => true, :active_tab => 0,
              :items => [
                {:title => "Contact", :layout => :form, :items => boss_contact},
                {:title => "Details", :layout => :form, :items => boss_details}
              ]
            }
          ]
        }
      ]
    end
  end
end