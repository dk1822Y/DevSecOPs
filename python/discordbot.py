import discord
import discord.utils
from discord.ext import commands

from keep_alive import keep_alive

intents = discord.Intents().all()
bot = commands.Bot(
    command_prefix="$",  # Change to desired prefix
    case_insensitive=True,  # Commands aren't case-sensitive
    intents=intents
)

bot.author_id = id


@bot.event
async def on_ready():  # When the bot is ready
    print("I'm in")
    print(bot.user)  # Prints the bot's username and identifier

@bot.event
async def on_message(message: discord.Message) -> None:
    if message.author == bot.user or message.author.bot:
        return

@bot.event
async def on_voice_state_update(member, before, after):
    guild = bot.get_guild(123)
    member = guild.get_member(123)

    if before.channel is None and after.channel is not None:
        await member.move_to(None)

keep_alive()
token = "token"
bot.run(token)