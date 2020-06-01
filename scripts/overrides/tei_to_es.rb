class TeiToEs

  ################
  #    XPATHS    #
  ################

  # in the below example, the xpath for "person" is altered
  def override_xpaths
    xpaths = {}
    xpaths["date"] = [
      "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date/@notBefore",
      "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date/@when"
    ]
    xpaths["date_display"] = "/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date"
    return xpaths
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

  def date(before=true)
    date = ""
    @xpaths["date"].each do |xpath|
      date = get_text(xpath)
      break if !date.empty?
    end
    CommonXml.date_standardize(date, before)
  end

  # TODO check if this is a good assumption to be making
  def format
    "manuscript"
  end

  def language
    # TODO verify that none of these are primarily english
    "en"
  end

  def languages
    # TODO verify that none of these are multiple languages
    [ "en" ]
  end

  # TODO place, publisher, rights, rights_uri, rights_holder, source

  def subcategory
    # Note: used to be called "transcriptions"
    "manuscripts"
  end

  # TODO text other from author, title, publisher, pubplace, and date[@when]

  def uri
    # Note: no "tei" in below URL
    "#{@options["site_url"]}/manuscripts/transcriptions/#{@filename}.html"
  end

end
