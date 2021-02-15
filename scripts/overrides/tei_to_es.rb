class TeiToEs

  ################
  #    XPATHS    #
  ################

  # in the below example, the xpath for "person" is altered
  def override_xpaths
    xpaths = {}
    xpaths["rights_holder"] = "//publicationStmt/distributor"
    xpaths["source"] = {
      "org" => "//sourceDesc/bibl/orgName",
      "note" => "//sourcesDesc/bibl/note[@type='project']"
    }
    xpaths
  end

  #################
  #    GENERAL    #
  #################

  # Add more fields
  #  make sure they follow the custom field naming conventions
  #  *_d, *_i, *_k, *_t
  def assemble_collection_specific
    # TODO custom field text_type_k
  end

  ################
  #    FIELDS    #
  ################

  # Overrides of default behavior
  # Please see docs/tei_to_es.rb for complete instructions and examples

  def category
    "manuscripts"
  end

  # TODO check if this is a good assumption to be making
  def format
    "manuscript"
  end

  def keywords
  end

  def language
    # TODO verify that none of these are primarily english
    "en"
  end

  def languages
    # TODO verify that none of these are multiple languages
    [ "en" ]
  end

  def person
    []
  end

  def places
  end

  def publisher
  end

  def recipient
  end

  def source
    org = get_text(@xpaths["source"]["org"])
    note = get_text(@xpaths["source"]["note"])
    [ org, note ].compact
                 .reject(&:empty?)
                 .join(", ")
  end

  def subcategory
    # Note: used to be called "transcriptions"
    "manuscripts"
  end

  def topics
  end

  def uri
    # Note: no "tei" in below URL
    "#{@options["site_url"]}/manuscripts/transcriptions/#{@filename}.html"
  end

  def works
  end

end
