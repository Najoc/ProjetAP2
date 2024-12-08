(*test duplicates*)

(*let depensetout01 = "wordlists/depensetout01.txt";;
let depensetout02 = "wordlists/depensetout02.txt";;

let slogram01 = "wordlists/slogram01.txt";;
let slogram02 = "wordlists/slogram02.txt";;

let wholedepensetout = Func.concatenate_files depensetout01 depensetout02;;
let duplicates = Func.remove_duplicates wholedepensetout;;*)

(*print_endline("DUPLICATES IN WHOLEDEPENSETOUT:");
Func.print_duplicates wholedepensetout;;

print_endline("DUPLICATES AFTER REMOVING:");
Func.print_duplicates duplicates;;*)

(*test hashing passwords*)
(*let hashed_duplicates = Func.hash_every_password(duplicates);;
Func.print_data_from_list hashed_duplicates;;*)

(*find same login + password in two folders and extract them into a new list*)
let slogram01 = "wordlists/slogram01.txt";;
let slogram02 = "wordlists/slogram02.txt";;
let slogram_with_duplicates = Func.concatenate_files slogram01 slogram02;;
let slogram = Func.remove_duplicates slogram_with_duplicates;;

let depensetout01 = "wordlists/depensetout01.txt";;
let depensetout02 = "wordlists/depensetout02.txt";;
let depensetout_with_duplicates = Func.concatenate_files depensetout01 depensetout02;;
let depensetout_unhashed = Func.remove_duplicates depensetout_with_duplicates;;
let depensetout = Func.hash_every_password(depensetout_unhashed);;
(*Joris Cuny & Mahamat Bokhit*)


let slogram_depensetout = Func.concatenate_lists slogram depensetout;;
let slogram_depensetout_duplicates = Func.find_duplicates slogram_depensetout;;

(*print_endline("DUPLICATES EXTRACTED IN LIST:");;
Func.print_data_from_list slogram_depensetout_duplicates;;
print_endline("DUPLICATES FOUND:");;
Func.print_duplicates slogram_depensetout;; 
WORKING *)

(* Clear password extraction test 
let slogram_clear = Func.extract_clear_password slogram_depensetout_duplicates depensetout_unhashed;;
Func.print_data_from_list slogram_clear;;
WORKING 

 Create then Print a triplet 
let slogram_answer = Func.create_triples "Slogram" slogram_clear;;
Func.print_triples slogram_answer;;*)

let passwords = Func.read_passwords_from_file "wordlists/french_passwords_top20000.txt";;
(*Func.print_passwords_from_list passwords;;*)
let passwords_hashed = Func.hash_french_passwords passwords;;
let pass_hashmap = Func.combine_lists passwords passwords_hashed;;

let pass_slogram = Func.extract_clear_password_compare_hash pass_hashmap slogram;;
Func.print_data_from_list pass_slogram;;
