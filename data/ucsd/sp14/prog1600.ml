
type attrib =
  | Name of string
  | Age of int;;

let _ =
  let welcome a = match a with | Name s -> s | Age i -> i in welcome (Age 36);;
