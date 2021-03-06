# frozen_string_literal: true

# A singleton class to get the list of attributes
# from a work.
#
# It is a Singleton so that there is only one of these
# initialized and uses the ||= operator so that when you
# read the attributes property it uses an already initialized
# work.
#
# This is to ensure that we can get a list of the attributes
# programmatically, but without using any unnecessary memory.
module Zizia
  class WorkAttributes
    include Singleton
    attr_reader :attributes, :properties, :validators, :local_attributes

    def initialize
      work ||= klass.new
      @local_attributes || work.local_attributes
      @attributes ||= work.local_attributes
      @properties ||= work.send(:properties)
      @validators ||= work.send(:_validators)
    end

    # Override to choose a different Work class
    def klass
      wtype=ENV.fetch('WORK_TYPE')
      if wtype=="GraduateThesisOrDissertation" then
        model=GraduateThesisOrDissertation
      elsif wtype=="UndergraduateHonorsThesis" then
        model=UndergraduateHonorsThesis 
      elsif wtype=="Article" then
        model=Article
      elsif wtype=="Book" then
        model=Book
      elsif wtype=="BookChapter" then
        model=BookChapter
      elsif wtype == "ConferenceProceeding" then
        model=ConferenceProceeding
      elsif wtype == "Presentation" then
        model= Presentation
      elsif wtype == "Report"
        model= Report
      elsif wtype == "Dataset"
        model = Dataset
      elsif wtype == "Default"
        model= Default
      end
      model
    end
  end
end
