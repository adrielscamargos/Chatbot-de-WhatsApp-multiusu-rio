const mysql = require('mysql2/promise');

const createConnection = async () => {
	return await mysql.createConnection({
		host: process.env.DB_HOST,
		user: process.env.DB_USER,
		password: process.env.DB_PASS,
		database: process.env.DB_NAME
	});
}

function delay(t, v) {
	return new Promise(function(resolve) { 
		setTimeout(resolve.bind(null, v), t)
	});
}

const getGrupo = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('SELECT * FROM statusgrupos');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const insertGrupo = async (grupos) => {
	const connection = await createConnection();
	const [rows] = await connection.execute("INSERT INTO `statusgrupos` (`id`, `status`, `createdAt`, `updatedAt`) VALUES (NULL, ?, current_timestamp(), current_timestamp());", [grupos]);
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const getWhatsApp = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('SELECT * FROM agstatuswhatsapps');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const insertWhatsApp = async (wpp) => {
	const connection = await createConnection();
	const [rows] = await connection.execute("INSERT INTO `agstatuswhatsapps` (`id`, `status`, `createdAt`, `updatedAt`) VALUES (NULL, ?, current_timestamp(), current_timestamp());", [wpp]);
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const getHorario = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('SELECT * FROM horariochatbots');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const insertHorario = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute("INSERT INTO `horariochatbots` (`id`, `inicio`, `termino`, `createdAt`, `updatedAt`) VALUES (NULL, '00:00:00', '23:58:00', '2022-06-01 00:28:37.000000', '2022-06-01 00:28:37.000000');");
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const getLimite = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('SELECT * FROM limiteconexoes');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const insertLimite = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute("INSERT INTO `limiteconexoes` (`id`, `whatsapp`, `user`, `createdAt`, `updatedAt`) VALUES (NULL, '3', '3', '2022-06-01 00:29:25.000000', '2022-06-01 00:29:25.000000');");
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}


const updateChatBot = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO statuschatbots (msgFrom) SELECT number FROM Contacts t1 WHERE t1.number NOT IN (SELECT msgFrom FROM statuschatbots)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateZDGPadrao = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO chatbots (`id`, `pergunta`, `resposta`, `createdAt`, `updatedAt`) VALUES (NULL, "ZDGPadrao", "ZDGPadrao é o código utilizado para enviar uma resposta coringa, quando o ChatBOT MYSQL está ativado, e não existem perguntas/respostas disponíveis para a interação.", "2023-01-01 18:30:23.000000", "2023-01-01 18:30:23.000000")');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const getZDGPadrao = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('SELECT * FROM `chatbots` WHERE `pergunta` = "ZDGPadrao"');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateDialogFlowAudio = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO dialogFlowaudios (msgFrom) SELECT number FROM Contacts t1 WHERE t1.number NOT IN (SELECT msgFrom FROM dialogFlowaudios)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateDialogFlow = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO dialogFlows (msgFrom) SELECT number FROM Contacts t1 WHERE t1.number NOT IN (SELECT msgFrom FROM dialogFlows)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateN8N = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO n8ns (msgFrom) SELECT number FROM Contacts t1 WHERE t1.number NOT IN (SELECT msgFrom FROM n8ns)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateTag = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO tagcontacts (usuario) SELECT number FROM Contacts t1 WHERE t1.number NOT IN (SELECT usuario FROM tagcontacts)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const updateWhatsApp = async () => {
	const connection = await createConnection();
	const [rows] = await connection.execute('INSERT INTO statuswhatsapps (nome, idWhaticket) SELECT name, id FROM Whatsapps t1 WHERE t1.id NOT IN (SELECT idWhaticket FROM statuswhatsapps)');
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvChatbot = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `statuschatbots` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvDialogFlow = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `dialogFlows` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvDialogFlowAudio = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `dialogFlowaudios` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvN8N = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `n8ns` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvGrupos = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `statusgrupos` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvWpp = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `statuswhatsapps` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}

const alterEnvAgendamento = async (env) => {
	const connection = await createConnection();
	const [rows] = await connection.execute('ALTER TABLE `agstatuswhatsapps` CHANGE `status` `status` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ?', [env] );
	delay(10000).then(async function() {
		await connection.end();
		delay(500).then(async function() {
			connection.destroy();
			//console.log('© MAGNETICKET  Conexão fechada')
		});
		//console.log('© MAGNETICKET  Conexão fechada')
	});
	if (rows.length > 0) return true;
	return false;
}


module.exports = {
	insertGrupo,
	insertWhatsApp,
	insertHorario,
	insertLimite,
	updateChatBot,
	getZDGPadrao,
	updateZDGPadrao,
	updateDialogFlowAudio,
	updateDialogFlow,
	updateN8N,
	updateWhatsApp,
	getGrupo,
	getHorario,
	getLimite,
	getWhatsApp,
	updateTag,
	alterEnvChatbot,
	alterEnvDialogFlow,
	alterEnvDialogFlowAudio,
	alterEnvN8N,
	alterEnvGrupos,
	alterEnvWpp,
	alterEnvAgendamento
}