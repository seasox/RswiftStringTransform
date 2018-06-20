# takeas an NSLocalizedString(...) string and transforms it to the tr(...) format

localizable=ARGV[0]

def makeFirstLetterLower(string)
    string[0].downcase + string[1..-1]
end

def makeFirstLetterUpper(string)
    if string.length == 0
	return string
    else
	string[0].upcase + string[1..-1]
    end
end

def transformPrefix(string)
    out = string

    upperCasedPrefixRegex = /^([A-Z]+)(?=[^a-z]{1})/

    return makeFirstLetterLower(string.gsub(upperCasedPrefixRegex) do 
	$1.downcase
    end)
end

# remoe leading and trailing code
localizable = localizable.gsub("\\n", "").gsub("NSLocalizedString(", "").gsub(/comment:\s*"[^"]*"\)/, "").gsub(/[^A-Za-z0-9_ ]/, "")

# remove all whitespace and "" and ,
localizable = localizable.split(/[\s]+/).map { |a| makeFirstLetterUpper(a) }.join("")

# uppercase first letters of every word, leaving the rest be as it is
localizable = transformPrefix(localizable)

puts "R.string.localizable.#{localizable}()"
