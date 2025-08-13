# whitman-manuscripts
Data Repo | Whitman Manuscripts TEI

This repo shares its Ruby gem dependencies with all other Whitman data
repos via the
[Gemfile](https://github.com/whitmanarchive/whitman-scripts/blob/main/Gemfile)
in the [whitman-scripts
repo](https://github.com/whitmanarchive/whitman-scripts)

This repo also has works-related documents which require `post`-ing
with `threads: 1` in `config/public.yml` or `config/private.yml` to not
break writing to `../whitman-scripts/source/json/works_and_items.json`

If you do not set threads to 1, then there will be a message `set threads to 1 in private.yml to modify works_and_items file`. See [works ingest documentation](https://github.com/whitmanarchive/whitman-scripts/blob/dev/docs/work-ingest.md).

[<em>The Walt Whitman Archive</em>](http://whitmanarchive.org/) endeavors to make Whitman's vast work freely and conveniently accessible to scholars, students, and general readers. Whitman's major life work, <em>Leaves of Grass</em>, went through six very different editions, each of which was issued in a number of formats, creating a book that is probably best studied as numerous distinct creations rather than as a single revised work. His many other writings—varied and significant—include fiction, notebooks, manuscript fragments, prose essays, letters, marginalia, and voluminous journalistic articles. Drawing on the resources of libraries and collections from around the world, the <em>Whitman Archive</em> is the most comprehensive record of works by and about Whitman—and continues to grow. The <em>Archive</em> is directed by Kenneth M. Price (University of Nebraska–Lincoln) and Ed Folsom (University of Iowa), with ongoing contributions from many other editor-scholars, students, information professionals, and technologists.

The <em>Walt Whitman Archive</em> data repositories include the base TEI/XML files that comprise several sections of the <em>Whitman Archive</em>.  All XML for a given section is available in the "tei" directory.  Other directories contain materials related to the process of indexing the files in SOLR and work in combination with the University of Nebraska-Lincoln Center for Digital Research in the Humanities [Datura](https://github.com/CDRH/datura) Ruby gem. For more information about the <em>Walt Whitman Archive</em>, including encoding guidelines and editorial policy statements, see [About the <em>Whitman Archive</em>](http://whitmanarchive.org/about/index.html).

*NOTE* Do not update this repository with development files! Only production files should be used with this repository, from `/var/local/www/cocoon/whitmanarchive/manuscripts/tei`

