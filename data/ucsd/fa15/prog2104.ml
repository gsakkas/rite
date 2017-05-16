
let dupe f x = ((f x), (f x));;

let _ = dupe 3;;
