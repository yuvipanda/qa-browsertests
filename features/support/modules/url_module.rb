module URLModule
  include PageObject

  def self.base_url
    if ENV['BASE_URL']
      ENV['BASE_URL']
    else
      "test2"
    end
  end
end
