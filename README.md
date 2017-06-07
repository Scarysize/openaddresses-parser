# Parse Open Addresses CSVs

Handles **big-ass** CSV files using Streams with a minimal memory footprint.

Retrieve the longitude and latitude values from a openaddresses CSV:

**Input**
```
-74.1507325,4.6651764,15B 15,,,,,,,,3f2bcf29569338db
-74.1507124,4.6652267,15B 21,,,,,,,,c1bde1886793d721
```

**Ouput**
```
-74.1507325,4.6651764
-74.1507124,4.6652267
```

## Build

```sh
corebuild -pkg str src/openaddresses_parser.native
```

## Usage

```sh
./openaddresses_parser.native <input> -o <ouput>
```

## Bench

All run on my MBP 2015, CPU 2,7 GHz Intel Core i5.

Input file:
- **size:** 1.1GB
- **lines:** 14.151.355

### String.split

| Implementation | Runtime | Memory |
| -------------- | ------- | ------ |
| ocaml.native   | 12.474s | ~7.6MB |
| ocaml.byte     | 49.444s | ~8.8MB |
| node.js        | 38.721s | ~44MB  |

### Regex

| Implementation | Runtime | Memory   |
| -------------- | ------- | ------   |
| ocaml.native   | 8.294s  | ~7.1MB   |
| ocaml.byte     | 11.097s | ~8.0MB   |
| node.js        | 19.423s | ~46.0MB  |

---

Input file:
- **size:** 6.6GB
- **lines:** 84.908.130

### Regex

| Implementation | Runtime | Memory   |
| -------------- | ------- | ------   |
| ocaml.native   | 141.034s  | ~7.7MB   |
| ocaml.byte     | 145.957s | ~8.2MB   |
| node.js        | 156.983s | ~89.0MB  |

