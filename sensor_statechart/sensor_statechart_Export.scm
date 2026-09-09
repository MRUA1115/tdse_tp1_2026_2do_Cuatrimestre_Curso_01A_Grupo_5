{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "interface:\r\n    in event EV_BTN_PRESSED\r\n    in event EV_BTN_NOT_PRESSED\r\n    in event tick\r\n    var DEL_BTN_NAME : integer = 0\r\n    var T_DEBOUNCE : integer = 10\r\n    out event EV_SYS_BTN_DOWN\r\n    out event EV_SYS_BTN_UP\r\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -176,
          "y": -122
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "UP",
            "fontSize": 11
          }
        },
        "id": "2825ef2b-94b2-44e3-87e7-b3c9bce37861",
        "z": 47
      },
      {
        "position": {
          "x": 251,
          "y": 148
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "DOWN",
            "fontSize": 11
          }
        },
        "id": "4639608e-b13f-4d9f-944b-5df0e88bd24b",
        "z": 85,
        "embeds": []
      },
      {
        "position": {
          "x": -173,
          "y": 145
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "RISING",
            "fontSize": 11
          }
        },
        "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d",
        "z": 87,
        "embeds": [
          "975d852f-0bc6-4332-84d9-593681108e74"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d"
        },
        "target": {
          "id": "2825ef2b-94b2-44e3-87e7-b3c9bce37861",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.667%",
              "dy": "100%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN_NAME >= T_DEBOUNCE] / raise EV_SYS_BTN_UP\r\n"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "af6cb716-e85d-4311-8443-282e5ce5c48c",
        "z": 88,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d"
        },
        "target": {
          "id": "4639608e-b13f-4d9f-944b-5df0e88bd24b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "20%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_PRESSED\r\n"
              }
            },
            "position": {
              "distance": 0.5027472527472527,
              "offset": 2,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3e553ecf-36c1-4be7-8bdb-de366f702b0f",
        "z": 90,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4639608e-b13f-4d9f-944b-5df0e88bd24b"
        },
        "target": {
          "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.667%",
              "dy": "86.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_NOT_PRESSED / DEL_BTN_NAME = 0\r\n"
              }
            },
            "position": {
              "distance": 0.5027472527472527,
              "offset": -4,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "915ecf19-ded8-46fc-bb4f-44a7883fa76d",
        "z": 91,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d"
        },
        "target": {
          "id": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.333%",
              "dy": "50%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN_NAME < T_DEBOUNCE] / DEL_BTN_NAME = DEL_BTN_NAME + 1\r\n"
              }
            },
            "position": {
              "distance": 0.5126881392254659,
              "offset": -9.87879581960661,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "975d852f-0bc6-4332-84d9-593681108e74",
        "z": 92,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -143,
            "y": 227
          },
          {
            "x": -197,
            "y": 175
          }
        ],
        "parent": "ab8dd20a-64bc-4d25-96eb-a4cdfa64ea7d"
      },
      {
        "position": {
          "x": 253,
          "y": -121
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "FALLING",
            "fontSize": 11
          }
        },
        "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e",
        "z": 96,
        "embeds": [
          "d1020ab1-a248-4f4f-a2c2-210f1f4ee8db"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "2825ef2b-94b2-44e3-87e7-b3c9bce37861"
        },
        "target": {
          "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5%",
              "dy": "21.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_PRESSED / DEL_BTN_NAME = 0\r\n"
              }
            },
            "position": {
              "distance": 0.502710027100271,
              "offset": 3,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "283d7a19-43f8-4602-a94b-931a479868a0",
        "z": 97,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e"
        },
        "target": {
          "id": "2825ef2b-94b2-44e3-87e7-b3c9bce37861",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.333%",
              "dy": "80%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_NOT_PRESSED\r\n"
              }
            },
            "position": {
              "distance": 0.502710027100271,
              "offset": -4,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e51205e3-652c-47d4-a621-a5a5cff4bdba",
        "z": 97,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e"
        },
        "target": {
          "id": "4639608e-b13f-4d9f-944b-5df0e88bd24b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.667%",
              "dy": "5%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN_NAME >= T_DEBOUNCE] / raise EV_SYS_BTN_DOWN\r\n"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1dd80b90-6133-4959-94ee-8de08ad50f17",
        "z": 97,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e"
        },
        "target": {
          "id": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "46.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN_NAME < T_DEBOUNCE] / DEL_BTN_NAME = DEL_BTN_NAME + 1\r\n"
              }
            },
            "position": {
              "distance": 0.511994892083495,
              "offset": -4.9864885005858985,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d1020ab1-a248-4f4f-a2c2-210f1f4ee8db",
        "z": 98,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 283,
            "y": -142
          },
          {
            "x": 338,
            "y": -142
          },
          {
            "x": 338,
            "y": -93
          }
        ],
        "parent": "79ad78a2-8643-40c1-b6db-b6d6ffcc4f0e"
      },
      {
        "position": {
          "x": -235,
          "y": -139
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "01f787b9-8670-4bc7-9a9f-f69487beea8d",
        "z": 100,
        "embeds": [
          "3393fc7f-d857-464a-b491-f3b6267812bd"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -235,
          "y": -124
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "3393fc7f-d857-464a-b491-f3b6267812bd",
        "z": 101,
        "parent": "01f787b9-8670-4bc7-9a9f-f69487beea8d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "01f787b9-8670-4bc7-9a9f-f69487beea8d"
        },
        "target": {
          "id": "2825ef2b-94b2-44e3-87e7-b3c9bce37861",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10%",
              "dy": "56.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "877043e0-f1e5-4fd2-9550-73477b70d7f4",
        "z": 102,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}