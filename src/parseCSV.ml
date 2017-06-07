open Core
open Sys
open Printf
open Parser
open FileWriter

let start_parsing input output () =
  let (write_line, finish) = FileWriter.create output in
  Parser.parse input write_line;
  finish ();;

let file_exists filename =
  match Sys.file_exists filename with
  | true -> filename
  | false -> eprintf "'%s' does not exist.\n" filename;
    exit 1;;

let valid_file =
  Command.Spec.Arg_type.create file_exists;;

let spec =
  Command.Spec.(
    empty
    +> anon ("filename" %: valid_file)
    +> flag "-o" (required file) ~doc:"the output file"
  )

let command =
  Command.basic
    ~summary: "Parse latitude and longitude values from an openaddresses CSV file."
    spec
    start_parsing;;

Command.run command;;
