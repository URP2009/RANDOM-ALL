import random

print("1 - For one player \n 2 - For two players \n 3 - For three players \n 4 - For four players \n 5 - for five players \n 0 - Exit")

attackers = [
    "GLAZ", "FUZE", "IQ", "BLITZ", "TWITCH", "MONTAGNE", "THERMITE", "ASH",
    "THATCHER", "SLEDGE", "BLACKBEARD", "CAPITAO", "HIBANA", "JACKAL", "YING",
    "ZOFIA", "DOKKAEBI", "FINKA", "LION", "MAVERICK", "NOMAD", "GRIDLOCK",
    "NOKK", "AMARU", "KALI", "IANA", "ACE", "ZERO", "FLORES", "OSA", "SENS",
    "GRIM", "BRAVA", "RAM", "DEIMOS", "STRIKER", "RAUORA", "SOLID_SNAKE", "BUCK"
]

defenders = [
    "KAPKAN", "TACHANKA", "BANDIT", "JAGER", "ROOK", "DOC", "PULSE", "CASTLE",
    "SMOKE", "MUTE", "FROST", "VALKYRIE", "CAVEIRA", "ECHO", "MIRA", "LESION",
    "ELA", "VIGIL", "ALIBI", "MAESTRO", "CLASH", "KAID", "MOZZIE", "WARDEN",
    "GOYO", "WAMAI", "ORYX", "MELUSI", "ARUNI", "THUNDERBIRD", "THORN", "AZAMI",
    "SOLIS", "FENRIR", "TUBARAO", "SENTRY", "SKOPOS", "DENARI", "NOOR"
]

players_count = int(input("How many players? "))

if players_count == 0 or players_count >=6:
    print("You have completed the random selection or made a mistake in your choice.")
else:
    shuffled_attackers = attackers.copy()
    shuffled_defenders = defenders.copy()
    random.shuffle(shuffled_attackers)
    random.shuffle(shuffled_defenders)

    for i in range(players_count):
        start = i * 4
        end = start + 4
        
        player_attackers = shuffled_attackers[start:end]
        player_defenders = shuffled_defenders[start:end]
        
        print("=====================================")
        print(f"For the {i + 1} player:")
        print("Attack:", ", ".join(player_attackers))
        print("Protection:", ", ".join(player_defenders))
