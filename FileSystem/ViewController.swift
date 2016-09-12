//
//  ViewController.swift
//  FileSystem
//
//  Created by Thales Toniolo on 10/4/15.
//  Copyright © 2015 Flameworks. All rights reserved.
//
import UIKit

// MARK: - Class Declaration
class ViewController: UIViewController {
	// MARK: - Public Objects
	
	// MARK: - Private Objects
	
	// MARK: - Interface Objects
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		// Documents do app sandbox
		let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
		let docPath: String = paths[0]
		print(docPath)
		let textFilePath = ("\(docPath)/myfile.txt")
		let meuTexto = "testando"
		let data: NSData = meuTexto.dataUsingEncoding(NSUTF8StringEncoding)!
		NSFileManager.defaultManager().createFileAtPath(textFilePath, contents: data, attributes: nil)

		// Recuperar o plist do projeto
		if let plistPath = NSBundle.mainBundle().pathForResource("MyPlist", ofType: "plist") {
			let arr = NSArray(contentsOfFile: plistPath)! // Iniciado em array
			for dict in arr {
				let nome = dict["Nome"]!
				let valor = dict["Valor"]!
				print("\(nome!) - \(valor!)")
			}
		}

		// Userdefaults
		if (NSUserDefaults.standardUserDefaults().objectForKey("bgColor") == nil) {
			NSUserDefaults.standardUserDefaults().setValue("S", forKey: "bgColor")
			self.view.backgroundColor = UIColor.blueColor()
		} else {
			NSUserDefaults.standardUserDefaults().removeObjectForKey("bgColor")
			self.view.backgroundColor = UIColor.redColor()
		}
		NSUserDefaults.standardUserDefaults().synchronize()
	}
	
	// MARK: - Private Methods
	
	// MARK: - Action Methods
	
	// MARK: - Public Methods
	
	// MARK: - Delegate/Datasource
	
	// MARK: - Navigation
//	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//		if (segue.identifier == "mySegue") {
//			//...
//		}
//	}
	
	// MARK: - Death Cycle
	override func viewDidDisappear(animated: Bool) {
		//...
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
