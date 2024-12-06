(*let depensetout = "wordlists/depensetout01.txt";;
Func.print_data_from_file depensetout;;
let slogram01 = "wordlists/slogram01.txt";;
Func.print_data_from_file slogram01;; *)

(*let slodepense = Func.concatenate_lists "wordlists/depensetout01.txt" "wordlists/slogram01.txt";;
Func.print_data_from_list slodepense;;*)

let duplicates = Func.fuse_and_remove_duplicates "wordlists/depensetout01.txt" "wordlists/depensetout02.txt";;
Func.print_data_from_list duplicates;;
