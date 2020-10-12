Script which adds a bunch of root files with a given prefix and suffix in the form foo\_%i.root. Takes 4 arguments, respectively:

<p>inPattern - input naming pattern ("foo" in the above), defaults to "foo\_in"<\p>
  
<p>outPattern - output naming pattern, defaults to "foo\_out"<\p>
  
<p>maxNFiles - maximum number of files to hadd together at once, defaults to 10<\p>
  
<p>override - boolean whether to use -f option for hadd command, defaults to false<\p>

**Example usage:** ./MyHadd.sh foo_in foo_out 2
