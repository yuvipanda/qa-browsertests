class EditPage
  include PageObject

  a(:my_sandbox, text: "My sandbox")
  button(:save, id: "wpSave")
end
