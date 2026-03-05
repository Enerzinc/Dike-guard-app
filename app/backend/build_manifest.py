import json
from pathlib import Path

IMAGE_EXT = {".jpg", ".jpeg", ".png"}

def get_images(folder):
    if not folder.exists():
        return []

    images = []
    for file in sorted(folder.iterdir()):
        if file.suffix.lower() in IMAGE_EXT:
            images.append(str(file))

    return images


def build_manifest(mission_folder):

    mission_path = Path(mission_folder)
    stations_path = mission_path / "stations"

    stations = []

    for station in stations_path.iterdir():

        if not station.is_dir():
            continue

        raw = get_images(station / "raw")
        cracks = get_images(station / "cracks")
        thermal = get_images(station / "thermal")

        lidar_file = None
        lidar_path = station / "lidar"

        if lidar_path.exists():
            for f in lidar_path.iterdir():
                if f.suffix.lower() in [".ply", ".pcd", ".lds"]:
                    lidar_file = str(f)
                    break

        station_data = {
            "station_id": station.name,
            "raw_images": raw,
            "crack_images": cracks,
            "thermal_images": thermal,
            "lidar": lidar_file
        }

        stations.append(station_data)

    manifest = {
        "mission": mission_path.name,
        "total_stations": len(stations),
        "stations": stations
    }

    return manifest


def save_manifest(mission_folder):

    manifest = build_manifest(mission_folder)

    output = Path("data.json")

    with open(output, "w") as f:
        json.dump(manifest, f, indent=4)

    print("Manifest created:", output)


if __name__ == "__main__":

    mission = "received_data/mission_001"

    save_manifest(mission)