import csv
import json

def csv_to_json(csv_file_path, json_file_path):
    spells = []

    with open(csv_file_path, mode='r', encoding='gbk') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            spell = {
                "name": row["法术名"],
                "level": row["环阶"],
                "school": row["学派"],
                "ritual": row["仪式"] == "√",
                "castingTime": row["施法时间"],
                "range": row["施法距离"],
                "verbal": row["V 言语"] == "V",
                "somatic": row["S 姿势"] == "S",
                "material": row["M 材料"] == "M",
                "materialComponents": row["材料内容"],
                "duration": row["持续时间"],
                "description": row["法术详述"],
                "englishName": row["英文名"],
                "classes": [
                    "吟游诗人" if row["吟游诗人"] == "√" else None,
                    "牧师" if row["牧师"] == "√" else None,
                    "德鲁伊" if row["德鲁伊"] == "√" else None,
                    "圣武士" if row["圣武士"] == "√" else None,
                    "游侠" if row["游侠"] == "√" else None,
                    "术士" if row["术士"] == "√" else None,
                    "邪术师" if row["邪术师"] == "√" else None,
                    "法师" if row["法师"] == "√" else None,
                    "奇械师" if row["奇械师"] == "√" else None,
                    "时间法师" if row["时间法师"] == "√" else None,
                    "重力法师" if row["重力法师"] == "√" else None
                ],
                "source": row["出处"]
            }
            # Remove None values from classes
            spell["classes"] = [cls for cls in spell["classes"] if cls is not None]
            spells.append(spell)

    with open(json_file_path, mode='w', encoding='utf-8') as json_file:
        json.dump(spells, json_file, ensure_ascii=False, indent=4)

# Example usage
csv_to_json('tools/data.csv', 'assets/spells.json')