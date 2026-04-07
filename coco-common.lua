local saved_link_node = nil
local saved_color_node = nil
local function get_first_list_node(head)
   for n in node.traverse(head) do
      if n.id == node.id ("hlist") or
 n.id == node.id("vlist") then
 return n
      end
   end
   return nil
end
local function get_last_list_node(head)
   local last_node = nil
   for n in node.traverse(head) do
      if n.id == node.id ("hlist") or
 n.id == node.id("vlist") then
 last_node = n
      end
   end
   return last_node
end
local function traverse(head)
   for n in node.traverse(head) do
      if n.id == node.id("whatsit") then
 if n.subtype == table.swapped(node.whatsits ())["pdf_start_link"] then
    if saved_link_node then
       node.free(saved_link_node)
    end
    saved_link_node = node.copy(n)
 elseif n.subtype == table.swapped(node.whatsits ())["pdf_colorstack"] then
    if saved_link_node then
       if n.command == 1 or(n.data and not(n.data == "")) then
  if saved_color_node then
     node.free(saved_color_node)
  end
  saved_color_node = node.copy(n)
       elseif n.command == 2 or n.data == "" then
  if saved_color_node then
     node.free(saved_color_node)
     saved_color_node = nil
  end
       end
    end
 elseif n.subtype == table.swapped(node.whatsits ())["pdf_end_link"] then
    if saved_link_node then
       node.free(saved_link_node)
       saved_link_node = nil
    end
    if saved_color_node then
       node.free(saved_color_node)
       saved_color_node = nil
    end
 end
      elseif n.id == node.id("hlist") or n.id == node.id("vlist") then
 traverse(n.head)
      end
   end
end
local function split_footins_links(head)
   local footbox = tex.box[token.create('footins').index]
   if not footbox then return head end
   if saved_link_node then
      local first_line = get_first_list_node(footbox.list)
      if first_line then
 local new_start = node.copy(saved_link_node)
 first_line.list = node.insert_before(first_line.list, first_line.list, new_start)
 if saved_color_node then
    local new_color = node.copy(saved_color_node)
    first_line.list = node.insert_after(first_line.list, new_start, new_color)
 end
      end
   end
   traverse(footbox.list)
   if saved_link_node then
      local last_line = get_last_list_node(footbox.list)
      if last_line then
 if saved_color_node then
    local new_color_pop = node.new (node.id("whatsit"), table.swapped(node.whatsits ())["pdf_colorstack"])
    new_color_pop.command = 2
    new_color_pop.stack = saved_color_node.stack
    new_color_pop.data = ""
    last_line.list = node.insert_after(last_line.list, node.tail(last_line.list), new_color_pop)
    local new_end = node.new(node.id("whatsit"), table.swapped(node.whatsits ())["pdf_end_link"])
    last_line.list = node.insert_after (last_line.list, new_color_pop, new_end)
 else
    local new_end = node.new(node.id("whatsit") , table.swapped(node.whatsits ())["pdf_end_link"])
    last_line.list = node.insert_after(last_line.list, node.tail(last_line.list), new_end)
 end
      end
   end
   return head
end
luatexbase.add_to_callback('pre_output_filter', split_footins_links, 'split_footins_links')
