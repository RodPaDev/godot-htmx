extends RefCounted
class_name GDML


	

static func create_element(element: String, children: String = "", attr: Dictionary = {}):
	var html = "<" + element
	for key in attr.keys():
		html += " %s=\"%s\"" % [key, attr[key]]
	if children == "":
		html += " />"
	else:
		html += ">%s</%s>" % [children, element]
	return html

static func Fragment(children: Array[String]):
	var html := ""
	for child in children:
		html += child + "\n"
	return html
	
static func getSafeParams(unsafeParams: Dictionary):
	var params = {
		"children": "",
		"attr": {}
	}
	if unsafeParams.has("children"):
		params.children = unsafeParams.children
	if unsafeParams.has("attr"):
		params.attr = unsafeParams.attr
	
	return params

static func Meta(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("meta", params.children, params.attr)

static func Title(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("title", params.children, params.attr)

static func Head(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("head", params.children, params.attr)

static func ScriptTag(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("script", params.children, params.attr)

static func Link(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("Link", params.children, params.attr)

static func A(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("a", params.children, params.attr)

static func Abbr(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("abbr", params.children, params.attr)

static func Address(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("address", params.children, params.attr)

static func Area(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("area", params.children, params.attr)

static func Article(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("article", params.children, params.attr)

static func Aside(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("aside", params.children, params.attr)

static func Audio(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("audio", params.children, params.attr)

static func B(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("b", params.children, params.attr)

static func Bdi(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("bdi", params.children, params.attr)

static func Bdo(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("bdo", params.children, params.attr)

static func Blockquote(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("blockquote", params.children, params.attr)

static func Body(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("body", params.children, params.attr)

static func Br(unsafeParams = {}):
	var params = getSafeParams(unsafeParams)
	return create_element("br", params.children, params.attr)

static func Button(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("button", params.children, params.attr)

static func Canvas(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("canvas", params.children, params.attr)

static func Caption(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("caption", params.children, params.attr)

static func Cite(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("cite", params.children, params.attr)

static func Code(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("code", params.children, params.attr)

static func Col(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("col", params.children, params.attr)

static func Colgroup(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("colgroup", params.children, params.attr)

static func Command(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("command", params.children, params.attr)

static func Datalist(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("datalist", params.children, params.attr)

static func Dd(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("dd", params.children, params.attr)

static func Del(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("del", params.children, params.attr)

static func Details(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("details", params.children, params.attr)

static func Dfn(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("dfn", params.children, params.attr)

static func Div(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("div", params.children, params.attr)

static func Dl(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("dl", params.children, params.attr)

static func Dt(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("dt", params.children, params.attr)

static func Em(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("em", params.children, params.attr)

static func Embed(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("embed", params.children, params.attr)

static func Fieldset(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("fieldset", params.children, params.attr)

static func Figcaption(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("figcaption", params.children, params.attr)

static func Figure(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("figure", params.children, params.attr)

static func Footer(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("footer", params.children, params.attr)

static func Form(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("form", params.children, params.attr)

static func H1(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h1", params.children, params.attr)

static func H2(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h2", params.children, params.attr)

static func H3(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h3", params.children, params.attr)

static func H4(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h4", params.children, params.attr)

static func H5(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h5", params.children, params.attr)

static func H6(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("h6", params.children, params.attr)

static func Header(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("header", params.children, params.attr)

static func Hr(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("hr", params.children, params.attr)

static func Html(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("html", params.children, params.attr)

static func I(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("i", params.children, params.attr)

static func Iframe(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("iframe", params.children, params.attr)

static func Img(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("img", params.children, params.attr)

static func Input(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("input", params.children, params.attr)

static func Ins(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("ins", params.children, params.attr)

static func Kbd(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("kbd", params.children, params.attr)

static func Keygen(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("keygen", params.children, params.attr)

static func Label(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("label", params.children, params.attr)

static func Legend(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("legend", params.children, params.attr)

static func Li(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("li", params.children, params.attr)

static func Main(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("main", params.children, params.attr)

static func Map(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("map", params.children, params.attr)

static func Mark(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("mark", params.children, params.attr)

static func Menu(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("menu", params.children, params.attr)

static func Meter(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("meter", params.children, params.attr)

static func Nav(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("nav", params.children, params.attr)

static func Object(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("object", params.children, params.attr)

static func Ol(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("ol", params.children, params.attr)

static func Optgroup(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("optgroup", params.children, params.attr)

static func Option(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("option", params.children, params.attr)

static func Output(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("output", params.children, params.attr)

static func P(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("p", params.children, params.attr)

static func Param(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("param", params.children, params.attr)

static func Pre(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("pre", params.children, params.attr)

static func Progress(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("progress", params.children, params.attr)

static func Q(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("q", params.children, params.attr)

static func Rp(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("rp", params.children, params.attr)

static func Rt(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("rt", params.children, params.attr)

static func Ruby(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("ruby", params.children, params.attr)

static func S(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("s", params.children, params.attr)

static func Samp(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("samp", params.children, params.attr)

static func Section(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("section", params.children, params.attr)

static func Select(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("select", params.children, params.attr)

static func Small(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("small", params.children, params.attr)

static func Source(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("source", params.children, params.attr)

static func Span(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("span", params.children, params.attr)

static func Strong(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("strong", params.children, params.attr)

static func Sub(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("sub", params.children, params.attr)

static func Summary(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("summary", params.children, params.attr)

static func Sup(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("sup", params.children, params.attr)

static func Table(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("table", params.children, params.attr)

static func Tbody(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("tbody", params.children, params.attr)

static func Td(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("td", params.children, params.attr)

static func Textarea(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("textarea", params.children, params.attr)

static func Tfoot(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("tfoot", params.children, params.attr)

static func Th(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("th", params.children, params.attr)

static func Thead(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("thead", params.children, params.attr)

static func Time(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("time", params.children, params.attr)

static func Tr(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("tr", params.children, params.attr)

static func Track(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("track", params.children, params.attr)

static func U(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("u", params.children, params.attr)

static func Ul(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("ul", params.children, params.attr)

static func Var(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("var", params.children, params.attr)

static func Video(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("video", params.children, params.attr)

static func Wbr(unsafeParams):
	var params = getSafeParams(unsafeParams)
	return create_element("wbr", params.children, params.attr)


