import json
import sys

def extractValues(configPath):
    with open(configPath, 'r') as file:
        config = json.load(file)
    
    numSeeds = config["dataCollectionOptions"]["numSeeds"]
    numTimesteps = config["sugarscapeOptions"]["timesteps"]
    decisionModels = config["dataCollectionOptions"]["decisionModels"]
    decisionModelsStr = ','.join(decisionModels)
    print(f"{numSeeds} {numTimesteps} {decisionModelsStr}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 extractConfig.py <config_file>")
        sys.exit(1)
    
    configPath = sys.argv[1]
    extractValues(configPath)