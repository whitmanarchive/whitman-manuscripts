require_relative "../../../whitman-scripts/scripts/ruby/get_works_info.rb"
class TeiToEs

  ################
  #    XPATHS    #
  ################

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
    "Literary Manuscripts"
  end

  def category2
    "Literary Manuscripts / Loose Manuscripts"
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

  # def languages
  #   # TODO verify that none of these are multiple languages
  #   [ "en" ]
  # end

  def person
    []
  end

  def places
  end

  def publisher
  end

  def source
    org = get_text(@xpaths["source"]["org"])
    note = get_text(@xpaths["source"]["note"])
    [ org, note ].compact
                 .reject(&:empty?)
                 .join(", ")
  end

  def topics
  end

  def uri
    "#{@options["site_url"]}/item/#{@filename}.html"
  end

  def works
  end

  def citation
    # WorksInfo is get_works_info.rb in whitman-scripts repo
    @works_info = WorksInfo.new(xml, @id)
    ids, names = @works_info.get_works_info
    citations = []
    if ids && ids.length > 0
      ids.each_with_index do |id, idx|
        name = names[idx]
        if !name
          puts "#{self.get_id} has bad work ids"
        end
        citations << {
          "id" => id,
          "title" => name,
          "role" => "whitman_id"
        }
      end
    end
    citations
  end

end
