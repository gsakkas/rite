AppG (fromList [LitG,ListG (fromList [EmptyG])])
String.concat ""
              ["sin(pi*" ; exprToString s ; ")"]
String.concat ""
              ["cos(pi*" ; exprToString s ; ")"]
String.concat ""
              ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
String.concat ""
              [exprToString s ; "*" ; exprToString p]
String.concat ""
              ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
