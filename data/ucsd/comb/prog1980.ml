
let rec wwhile (f,b) = if snd f b then wwhile f fst f b else fst f b;;
