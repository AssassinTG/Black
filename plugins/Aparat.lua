local function run(msg, matches)
	if matches[1]:lower() == 'aparat' then
		local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
		local jdat = json:decode(url)

		local items = jdat.videobysearch
		text = 'Results in Aparat: \n'
		for i = 1, #items do
		text = text..'\n'..i..'- '..items[i].title..'  -  view: '..items[i].visit_cnt..'\n    link: aparat.com/v/'..items[i].uid
		end
		text = text..''
		return text
	end
end

return {
   patterns = {
"^[#/!]([Aa]parat) (.*)$",
"^([Aa]parat) (.*)$",
   },
   run = run
}
