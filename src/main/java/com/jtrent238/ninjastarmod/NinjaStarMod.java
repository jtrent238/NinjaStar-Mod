package com.jtrent238.ninjastarmod;

import java.util.ArrayList;

import com.jtrent238.ninjastarmod.common.CommonProxy;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_diamond;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_gold;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_iron;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_stone;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_wood;

import cpw.mods.fml.common.Loader;
import cpw.mods.fml.common.Mod;
import cpw.mods.fml.common.Mod.EventHandler;
import cpw.mods.fml.common.Mod.Instance;
import cpw.mods.fml.common.ModContainer;
import cpw.mods.fml.common.SidedProxy;
import cpw.mods.fml.common.event.FMLInitializationEvent;
import cpw.mods.fml.common.event.FMLPostInitializationEvent;
import cpw.mods.fml.common.event.FMLPreInitializationEvent;
import cpw.mods.fml.common.event.FMLServerStartingEvent;
import cpw.mods.fml.common.eventhandler.EventPriority;
import cpw.mods.fml.common.network.IGuiHandler;
import cpw.mods.fml.common.network.NetworkRegistry;
import cpw.mods.fml.common.registry.EntityRegistry;
import cpw.mods.fml.common.registry.GameRegistry;
import cpw.mods.fml.common.registry.LanguageRegistry;
import net.minecraft.block.Block;
import net.minecraft.command.ICommandManager;
import net.minecraft.creativetab.CreativeTabs;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.init.Items;
import net.minecraft.item.Item;
import net.minecraft.item.ItemStack;
import net.minecraft.server.MinecraftServer;
import net.minecraft.util.WeightedRandomChestContent;
import net.minecraft.world.World;
import net.minecraftforge.client.event.RenderGameOverlayEvent;
import net.minecraftforge.common.ChestGenHooks;


@Mod(modid=NinjaStarMod.MODID, name=NinjaStarMod.MODNAME, version=(NinjaStarMod.MODVERSION)/*, dependencies="required-after:jtrent238core@[" + YouTubers.COREVERSION + "]"*/)
//@MeddleMod(id=Main.MODID, name=Main.MODNAME, version=(Main.MODVERSION), author=Main.MODAUTHOR)
public class NinjaStarMod 
{

	
	@SidedProxy(clientSide="com.jtrent238.ninjastarmod.client.ClientProxy", serverSide="com.jtrent238.ninjastarmod.common.CommonProxy")
	public static CommonProxy proxy;
	
	
	public static final String MODID = "ninjastarmod";

	@Instance(MODID)
    public static NinjaStarMod instance;
	public static final String MODVERSION = "1.0.0.0";
	public final static String COREVERSION = "1.0.0.3";
	public static final String MODNAME = "jtrent238's NinjaStar Mod";
	public static final String MODAUTHOR = "jtrent238";
	public static final String MC = "1.7.10";


	@ForgeSubscribe(priority = EventPriority.NORMAL)
    public void eventHandler(RenderGameOverlayEvent event) {

	}
	
	
@Mod.EventHandler
public void preInit(FMLPreInitializationEvent event)
{
	
}



@Mod.EventHandler
public void init(FMLInitializationEvent event)
{
	proxy.init(event);
	

	ItemLoader.LoadItems();
	//BlockLoader.loadBlocks();
	Recipes.registerRecpies();
	//EntityLoader.LoadYouTubers();
	//EntityLoader.LoadPlayers();
	//OreDict.addores();
	//Achievements.loadAchievements();
	//Stats.RegisterStats();
	//ChestGen.registerItems();
	
	EntityRegistry.registerModEntity(EntityNinjaStar.class, "NinjaStar", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	EntityRegistry.registerModEntity(EntityNinjaStar_wood.class, "NinjaStar_wood", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	EntityRegistry.registerModEntity(EntityNinjaStar_stone.class, "NinjaStar_stone", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	EntityRegistry.registerModEntity(EntityNinjaStar_iron.class, "NinjaStar_iron", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	EntityRegistry.registerModEntity(EntityNinjaStar_gold.class, "NinjaStar_gold", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	EntityRegistry.registerModEntity(EntityNinjaStar_diamond.class, "NinjaStar_diamond", EntityRegistry.findGlobalUniqueEntityId(), MODID, 80, 3, true);
	
	proxy.registerRenderThings();
}


public static CreativeTabs NinjaStarTab = new CreativeTabs("NinjaStarTab")

{
	public Item getTabIconItem() {

		return new ItemStack(ItemLoader.ItemNinjaStar_iron).getItem();
	}
	
	public boolean hasSearchBar(){
		return false;
	}
	/*
	@SideOnly(Side.CLIENT)
	public String getBackgroundImageName() 
	{
		return "EpicProportionsMod_Halloween.png";
	}
	
	@SideOnly(Side.CLIENT)
	public boolean drawInForegroundOfTab() 
	{
		return false;
	}
	*/
	
	};


public static Object logger;


@Mod.EventHandler
public void postInit(FMLPostInitializationEvent event) {
	{
		
	    
	}
}


@EventHandler
public void serverStart(FMLServerStartingEvent event)
{
     MinecraftServer server = MinecraftServer.getServer();
     // Get's the current server instance
     
     ICommandManager command = server.getCommandManager();
     //ServerCommandManager manager = (ServerCommandManager) command;
     
     //manager.registerCommand(new CommandModInfo());
     //manager.registerCommand(new CommandChangelog());
}

					
}