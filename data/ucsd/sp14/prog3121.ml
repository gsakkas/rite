
let notequals x y = x <> y;;

let notequals x y = if x <> y then (notequals, true);;
