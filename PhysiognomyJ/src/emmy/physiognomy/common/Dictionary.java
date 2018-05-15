package emmy.physiognomy.common;

import java.util.HashMap;
import java.util.Map;

public class Dictionary {
	public static Map<String, String> statementsCN = new HashMap<String, String>();
	public static Map<String, String> statementsEN = new HashMap<String, String>();

	static {
		// ------------- Statement Resource in Chinese--------------
		// Eyebrows
		statementsCN.put("narrow",
				"你凡事都容易操之过急，往往会招来措手不及的失败。由于肚量不够宽大，会经常把一些小事放在心上，造成精神上的忧患，情绪容易紧张。所以，要学会放松，放松心胸，才能让心情愉快，保持平常心是关键哦。");
		statementsCN.put("middle",
				"你为人做事进退有度能容忍。思维能力强，眼光长远开阔，沉稳，能够在事业职场上成为一个好领导，好上司。在生活和工作上与人交往，人缘交际关系良好，能够深得大家喜爱欢迎，相处愉快融洽。");
		statementsCN.put("wide",
				"你为人较聪明，任何事情都能把握，游刃有余，说话直爽，胸怀坦荡，具有包容心，对于一些事情，能够采取宽宏的态度，富有同情心。容易动情，易受异性吸引。经常会路见不平，拔刀相助。侠义心肠浓厚。");
		statementsCN.put("line",
				"你，一般思虑太多，容易为很多事情而烦忧，而这些事又都是可以轻易解决的。所以，没必要通通都放在心上。不要因为一些事情而顿生暴躁之心，以免招惹是非，还是多呼吸新鲜空气，大开心胸，充满愉悦之心对待生活吧。");
		// Lips
		statementsCN.put("thin",
				"你，无论是男是女，对于爱情方面，都有随机应变的本能，这是因为，你有时候，担心会在感情里受到伤害，所以，直觉得要保护自己。在爱情中，你很会说甜言蜜语；但，你也有吃苦耐劳的美德，这将会在你的婚姻生活中体现出来。");
		statementsCN.put("thick",
				"你，非常重视感情，对于爱情和婚姻，都充满了无限的期待和幻想，你喜欢浪漫的爱情，逐渐走入平稳的婚姻生活。爱情要轰轰烈烈，希望的婚姻是细水长流型。非常重情义，婚后，大都会是顾家、爱护伴侣的好太太、好老公。");
		statementsCN.put("normal", "你，性情温和，心地善良，特别富有同情心和幽默感，虽不绝顶聪明，但也不会愚蠢。与人相处，处处为人着想。一生衣禄随意，对物质享受不看重。");
		statementsCN.put("incline",
				"你，个性很消极，对于爱情也是倦倦的，你对爱情和婚姻很质疑，一般只相信自己。你对爱情还很不满，常常凌驾于爱情之上，蔑视爱情，诋毁婚姻。你常常会玩弄爱情，那其实是因为你内心对它是即挣扎又害怕的缘故。");
		statementsCN.put("upperLipThick", "你，重情义，可为好友两肋插刀，为人较随和，不太善言表达，内心的想法一般都会保留，但会通过行动去证明。");
		statementsCN.put("lowerLipThick", "你，在情爱方面比较被动又淡泊，你一向觉得感情是个不可靠的东西，因此在这个方面，很冷酷，不相信爱情的美好，更怀疑婚姻的可靠性。");
		// Eyes
		statementsCN.put("eYan", "你有纯美心地，沉稳干练，一生平安，多福多寿。");
		statementsCN.put("FengYan", "你聪慧过人，早年就可获功名利禄，地位显赫。");
		statementsCN.put("GeYan", "你淫荡，虚伪，难有作为。");
		statementsCN.put("HeYan", "你含蓄而深邃，能富贵，官运亨通。");
		statementsCN.put("HuYan", "你性格刚烈，有智识胸襟，富贵一生，只是晚年孩子会遇灾难。");
		statementsCN.put("KongQueYan", "你可居高官，一生顺遂；差相则脾气暴虐，命运不济。");
		statementsCN.put("LangYan", "你贪婪而鄙俗，一生虚度。");
		statementsCN.put("LongYan", "你为大贵相，是大才人。");
		statementsCN.put("SheYan", "你心性歹毒，不认亲属。");
		statementsCN.put("ShiFengYan", "你为贵人相，性情温顺，有涵养，多富贵。");
		statementsCN.put("TaoHuaYan", "你最有桃花运，放荡形骸，难成大器。");
		statementsCN.put("XiaMu", "你逢火年会遇灾害，水年则会顺利，晚年富贵，但短寿。");
		statementsCN.put("YanYan", "你有修养，懂礼貌，具有超然之才，能获富贵，且声名广大。");
		statementsCN.put("YuanYan", "你活泼，多疑，后代多，且都有灵性。");
		statementsCN.put("YuanYangYan", "你婚姻美满，多富贵，只是难逃情色之祸乱。");
		statementsCN.put("GuiYan", "你健康长寿，一生美满幸福，惠及子孙。");
		statementsCN.put("YuYan", "你命短，愚钝，郁郁而终。");
		statementsCN.put("XiongYan", "你天性愚直，爱逞强，但终受人约束。");
		statementsCN.put("YangYan", "你可承家产，但人缘差，少智薄才，终至家业败尽。");
		statementsCN.put("LuanYan", "你可居高官要职，不愁富贵。");
		statementsCN.put("ZhuYan", "你生活安逸，性情残暴，惹是生非，难逃法网。");
		statementsCN.put("MingFengYan", "你大器晚成，但也十分显达。");
		statementsCN.put("XiangYan", "你心胸豁达，乐观积极，长寿无疾而终。");
		statementsCN.put("ZuiYan", "你爱沉醉温柔乡，虚度年华，纵与情欲之乐。");

		// ------------- Statement in English--------------
		// eyebrows 
		statementsEN.put("narrow",
				"You tend to rush which may cause expected setbacks. You also tend to hold on to the pass without letting go even the slightest grudge, which may put you under stress and depression. Therefore, you gotta learn how to relax and let things go to be happy. It's the key to keep your mind in balance.");
		statementsEN.put("middle",
				"You understand the importance of boundary and limitation and quite tolerant. You're thoughtful, insightful, calm and have good vision, which makes you a good supervisor and leader at workplace. You are personable, easy to get along with, your friends and coworkers all like you.");
		statementsEN.put("wide",
				"You are smart, capable of handling everything, candid, straightforward, transparent, tolerant, empathetic. You are easily attracted and may be unfaithful. You stand out for people who need help.");
		// Lips
		statementsEN.put("normal",
				"You have an easy going personality, kindhearted, empathetic and humorous. Although you're not a genius, you are by no mean unintelligent. You are considerate. you are not material.");
		statementsEN.put("lowerLipThick",
				"In terms of relationship and dating, you are not a pursuer. You believe intimate relationship is unreliable so you stay aloof from attachment. You don't believe love and suspect the reliability of marriage.");
		// Eyes
		statementsEN.put("eYan",
				"You're kindhearted, mature and capable. Your life is blessed with peace and longevity.");

		statementsEN.put("YanYan", "You are polished, polite, very talented with a good fortune and reputation.");

		statementsEN.put("LuanYan", "You have such power, influence and finance is never a problem for you.");

	}

}
