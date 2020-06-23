class TeiToEs

  ################
  #    XPATHS    #
  ################

  # in the below example, the xpath for "person" is altered
  def override_xpaths
    xpaths = {}
    xpaths["annotations_text"] = "//notesStmt/note[@type='project']"
    xpaths["contributors"] = [
      "//titleStmt/respStmt/persName"
    ]
    xpaths["date"] = {
      "not_after" => "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date/@notAfter",
      "not_before" => "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date/@notBefore",
      "known" => "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date/@when"
    }
    xpaths["date_display"] = "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date"
    xpaths["rights"] = "//publicationStmt/availability"
    xpaths["rights_holder"] = "//publicationStmt/distributor"
    xpaths["rights_uri"] = "//publicationStmt/availability//ref/@target"
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

  def annotations_text
    get_text(@xpaths["annotations_text"])
  end

  def category
    "manuscripts"
  end

  def date(before=true)
    dt = get_text(@xpaths["date"]["known"])
    if dt.empty?
      # if there is no known date, use the not_before date
      # as the primary date for general searches / filtering
      dt = get_text(@xpaths["date"]["not_before"])
    end
    Datura::Helpers.date_standardize(dt)
  end

  def date_not_after
    dt = get_text(@xpaths["date"]["not_after"])
    dt.empty? ? date(false) : Datura::Helpers.date_standardize(dt, false)
  end

  def date_not_before
    dt = get_text(@xpaths["date"]["date_not_before"])
    dt.empty? ? date : Datura::Helpers.date_standardize(dt)
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

  def rights
    get_text(@xpaths["rights"])
  end

  def rights_holder
    get_text(@xpaths["rights_holder"])
  end

  def rights_uri
    get_text(@xpaths["rights_uri"])
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
