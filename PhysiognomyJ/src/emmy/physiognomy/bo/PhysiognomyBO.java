package emmy.physiognomy.bo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import emmy.physiognomy.common.Dictionary;
import emmy.physiognomy.model.AnalyzeResult;
import emmy.physiognomy.model.PhysiognomyData;

public class PhysiognomyBO {

	public AnalyzeResult analyze(String absolutePath, String filename, String folderName) {
		AnalyzeResult analyzeResult = new AnalyzeResult();

		BufferedReader br = null;
		try {
			// execute invocation arguments from python file
			String[] params = new String[] { "python", "C:/Emmy/PhysiognomyPy/src/physiognomy.py", absolutePath,
					filename };
			// String[] params = new String[] { "python",
			// "D:/Dream/PhysiognomyPy/src/physiognomy.py", absolutePath,
			// filename };
			// String[] params = new String[] { "python",
			// "C:/MyProject/PhysiognomyPy/src/physiognomy.py", absolutePath,
			// filename };

			// execute python file
			Process proc = Runtime.getRuntime().exec(params);

			// Creat a input stream to read the output of python
			br = new BufferedReader(new InputStreamReader(proc.getInputStream()));

			// save phyton result in list
			List<String> result = new ArrayList<String>();

			// read file
			String line = null;
			while ((line = br.readLine()) != null) {
				// save content to list
				result.add(line);
			}
			
			if (result.size() > 0) {
				// first line reflects the result of python analysis process 
				analyzeResult.setCode(result.get(0));
				// if process successful
				if ("success".equals(analyzeResult.getCode())) {

					// line 2: detailed analysis result with json，change json string to java object （jackson）
					String jsonStr = result.get(1).toString().replaceAll("'", "\"");
					// transform class of jackson to json string and object
					ObjectMapper mapper = new ObjectMapper();
					// ( json string, class, object)
					PhysiognomyData physiognomyData = mapper.readValue(jsonStr, PhysiognomyData.class);

					// line 3 - 5:  Top 5 matching result of eyes
					physiognomyData.setLeftEyeData(result.get(2).toString());
					physiognomyData.setRightEyeData(result.get(3).toString());
					physiognomyData.setAvgEyeData(result.get(4).toString());

					// line 6: the matching result of distance of eyebrows。
					physiognomyData.setBrowData(result.get(5).toString());

					// save file name
					physiognomyData.setFolderName(folderName);

					// save statement into result model
					analyzeResult.setPhysiognomyData(physiognomyData);

					// match the corresponding statement from dictionary by style code
					String statementCN1 = Dictionary.statementsCN.get(physiognomyData.getAvgEye()[0]);
					String statementCN2 = Dictionary.statementsCN.get(physiognomyData.getBrowStyle()[0]);
					String statementCN3 = Dictionary.statementsCN.get(physiognomyData.getLipStyle());
					// save statement into result model
					analyzeResult.setStatementCN1(statementCN1);
					analyzeResult.setStatementCN2(statementCN2);
					analyzeResult.setStatementCN3(statementCN3);

					// match the corresponding statement from dictionary by style code
					String statementEN1 = Dictionary.statementsEN.get(physiognomyData.getAvgEye()[0]);
					String statementEN2 = Dictionary.statementsEN.get(physiognomyData.getBrowStyle()[0]);
					String statementEN3 = Dictionary.statementsEN.get(physiognomyData.getLipStyle());
					// save the fate statement into result model 
					analyzeResult.setStatementEN1(statementEN1);
					analyzeResult.setStatementEN2(statementEN2);
					analyzeResult.setStatementEN3(statementEN3);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return analyzeResult;
	}
}
