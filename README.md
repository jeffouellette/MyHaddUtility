Script which adds a bunch of root files with a given prefix and suffix in the form foo\_%i.root. Takes 4 arguments, respectively:
  inPattern - input naming pattern ("foo" in the above), defaults to "foo\_in"
  outPattern - output naming pattern, defaults to "foo\_out"
  maxNFiles - maximum number of files to hadd together at once, defaults to 10
  override - boolean whether to use -f option for hadd command, defaults to false
