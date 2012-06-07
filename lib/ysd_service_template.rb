module TemplateService
  module TemplateBuilder

    @@options={}

    def self.build(template, data, options=nil)
      
      template_path = File.join(@@options[:root] || './', options[:locale]?"templates/#{options[:locale]}":'templates', "#{template}.erb")
      the_template = ERB.new File.read(template_path)
      result = the_template.result(binding)
      result
    end
    
    def self.setup(options)
      @@options = options
    end
    
  end
end