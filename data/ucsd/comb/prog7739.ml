
let rec fixpoint (f,b) = if not (b = (f b)) then fixpoint (f, (f b)) else f b;;

let fixpoint (f,b) = if not (f = (f b)) then fixpoint (f f b) else f b;;
