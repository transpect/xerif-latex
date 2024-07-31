local ltpdfa = require('ltpdfa')
meta = {
  Author = '',
  Title = '',
  Creator = '',
  Producer = '',
  Keywords = '',
  extract = function(self)
    local xmpfile = ltpdfa.metadata.xmphandler.fromFile(ltpdfa.config.metadata.xmpfile)
    local f = io.open(xmpfile, "rb")
    local content = f:read("*all")
    f:close()
    if (content:find('<dc:title>')) then
      local title = content:gsub('.*<dc:title>[^<]*<rdf:Alt>[^<]*<rdf:li[^>]*>(.*)</rdf:li>[^<]*</rdf:Alt>[^<]*</dc:title>.*', "%1")
      self.Title = title
    end
    local authors
    local author = {}
    if (content:find('<dc:creator>')) then
      authors = content:gsub('.*<dc:creator>[^<]*<rdf:Seq>(.*)</rdf:Seq>[^<]*</dc:creator>.*', "%1")
      for k in string.gmatch(authors, "<rdf:li>([^>]+)</rdf:li>") do
        table.insert(author , k)
      end
      self.Author = table.concat(author, '\\and ')
    end
    local keywords
    local keyword = {}
    if (content:find('dc:subject')) then
      keywords = content:gsub('.*<dc:subject>[^<]*<rdf:Bag>(.*)</rdf:Bag>[^<]*</dc:subject>.*', "%1")
      for k in string.gmatch(keywords, "<rdf:li>([^>]+)</rdf:li>") do
        table.insert(keyword , k)
      end
      self.Keywords = table.concat(keyword, '\\and ')
    elseif (content:find('pdf:Keywords')) then
      local keyword = content:gsub('.*<pdf:keywords>(.*)</pdf:Keywords>.*', "%1")
      self.Keywords = keyword
    end
    if (content:find('<pdf:Producer>')) then
      local prod = content:gsub('.*<pdf:Producer>(.*)</pdf:Producer>.*', "%1")
      self.Producer = prod
    end
    if (content:find('<xmp:CreatorTool>')) then
      local creatortool = content:gsub('.*<xmp:CreatorTool>(.*)</xmp:CreatorTool>.*', "%1")
      self.Creator = creatortool
    end
  end
}
if type(cocotex) ~= 'table' then
  cocotex = {}
end
cocotex.ally = {
  meta = meta
}
return cocotex.ally
