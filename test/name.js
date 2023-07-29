const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Namespace Registries", function () {
    let registrar;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {
        const NameRegistry = await ethers.getContractFactory(
            "NameRegistry"
        );
        const SpaceRegistry = await ethers.getContractFactory(
            "SpaceRegistry"
        );
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
        nameRegistry = await NameRegistry.deploy();
        spaceRegistry = await SpaceRegistry.deploy(nameRegistry.address);
    });

    describe("Name Registry", async function () {
        it("Inspect Admin", async function () {
            expect(await nameRegistry.viewAdmin()).to.equal(owner.address);
        });
        it("Inspect Qredential", async function () {
            expect(await nameRegistry.viewQredential()).to.equal("Qredential V1");
        });
        it("Register Name", async function () {
            await nameRegistry.connect(owner).registerName("raldblox", owner.address);
            expect(await nameRegistry.getRegistrant("raldblox")).to.equal(owner.address);
        });
    });

    describe("Space Registry", async function () {
        it("Inspect Admin", async function () {
            expect(await spaceRegistry.viewAdmin()).to.equal(owner.address);
        });
        it("Inspect Qredential", async function () {
            expect(await spaceRegistry.viewQredential()).to.equal("Qredential V1");
        });
        it("Register Space", async function () {
            await spaceRegistry.connect(owner).registerSpace("blox", owner.address);
            expect(await spaceRegistry.getRegistrant("blox")).to.equal(owner.address);
            // console.log(await spaceRegistry.getSpaceAddress("blox"));
        });
    });
});
